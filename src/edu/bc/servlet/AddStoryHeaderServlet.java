package edu.bc.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.io.*;
import java.util.*;

import javax.servlet.ServletConfig;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;

import edu.bc.dao.StoryHeaderDao;
import edu.bc.model.StoryHeaderModel;

public class AddStoryHeaderServlet extends HttpServlet {

	private boolean isMultipart;
	private String filePath;
	//private int maxFileSize = 50 * 1024;
	//private int maxMemSize = 4 * 1024;
	private File file;

	public void init() {
		// Get the file location where it would be stored.
		filePath = getServletContext().getInitParameter("file-upload");
	}

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StoryHeaderModel storyheadermodel = new StoryHeaderModel();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);

		int member_id = (int) session.getAttribute("member_id");
		String fileName = "";

		// Check that we have a file upload request
		isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setContentType("text/html");
		// java.io.PrintWriter out = response.getWriter( );

		if (!isMultipart) {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet upload</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<p>No file uploaded</p>");
			out.println("</body>");
			out.println("</html>");
			return;
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();

		// maximum size that will be stored in memory
		//factory.setSizeThreshold(maxMemSize);

		// Location to save data that is larger than maxMemSize.
		// factory.setRepository(new File("c:\\temp"));
		factory.setRepository(new File("//Users//amazon//eclipse-workspace//arnyoung//WebContent//images"));
		/// Users/amazon/eclipse-workspace/arnyoung/WebContent/images
		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// maximum file size to be uploaded.
		//upload.setSizeMax(maxFileSize);

		try {
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();

			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet upload</title>");
			out.println("</head>");
			out.println("<body>");

			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				if (!fi.isFormField()) {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					fileName = fi.getName();
					String contentType = fi.getContentType();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();

					// Write the file
					if (fileName.lastIndexOf("\\") >= 0) {
						file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
					} else {
						file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
					}
					fi.write(file);
					out.println("Uploaded Filename: " + fileName + "<br>");
				}
			}
			out.println("</body>");
			out.println("</html>");
		} catch (Exception ex) {
			System.out.println(ex);
		}

		// if (!"".equals(request.getParameter("fileField")) &&
		// request.getParameter("fileField") != null) {
		//
		// Part filePart = request.getPart("fileField"); // Retrieves <input type="file"
		// name="file">
		// fileName =
		// Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE
		// fix.
		// InputStream fileContent = filePart.getInputStream();
		//
		// }

		storyheadermodel.setMember_id(member_id);
		storyheadermodel.setStory_header_name(request.getParameter("storyHeaderName"));
		storyheadermodel.setStory_header_content(request.getParameter("storyHeaderContent"));
		storyheadermodel.setStory_header_img(fileName);

		if (StoryHeaderDao.InsertStoryHeader(storyheadermodel)) {
			// RequestDispatcher rd = request.getRequestDispatcher("storyheader.jsp");
			// rd.forward(request, response);

			response.sendRedirect(response.encodeRedirectURL(request.getContextPath()) + "/storyheader");
			return;
		} else {
			out.print("<p style=\"color:red\">Sorry your information is not correct</p>");

			// RequestDispatcher rd = request.getRequestDispatcher("storyheader.jsp");
			// out = response.getWriter();
			// response.setContentType("text/html");
			// out.println("<script type=\"text/javascript\">");
			// out.println("alert('Sorry username or password error');");
			// out.println("</script>");
			// rd.include(request, response);
		}

		out.close();
	}

	/**
	 * Extracts file name from HTTP header content-disposition
	 */
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
}
