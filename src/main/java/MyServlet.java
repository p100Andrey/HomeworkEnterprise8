import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/s")
public class MyServlet extends HttpServlet {
    String emptyTextArea;
    Map<String, String> records;
    List<String> checkedRecords;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("clear_tasks") != null) {
            records.clear();
            checkedRecords.clear();
        } else {
            Enumeration e = request.getParameterNames();
            boolean isNeedDeleteElements = false;
            while (e.hasMoreElements()) {
                checkedRecords.add((String) e.nextElement());
                isNeedDeleteElements = true;
            }

            String category = request.getParameter("category");
            String task_name = request.getParameter("task_name");
            if (category != null || task_name != null) {

                if (category.trim().equals("") || task_name.trim().equals("")) {
                    emptyTextArea = "Please fill the fields correctly";
                    request.setAttribute("error", emptyTextArea);
                } else {
                    records.put(task_name, category);
                }
            }
            if (isNeedDeleteElements) {
                records.keySet().removeAll(checkedRecords);
            }
        }

        request.setAttribute("result", records);
        checkedRecords.clear();
        pageRedirector("/index.jsp", request, response);
    }

    private void pageRedirector(String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final ServletContext servletContext = getServletContext();
        servletContext.getRequestDispatcher(page).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        pageRedirector("/index.jsp", request, response);
    }

    @Override
    public void init() throws ServletException {
        emptyTextArea = new String();
        records = new TreeMap();
        checkedRecords = new ArrayList<String>();
    }
}
