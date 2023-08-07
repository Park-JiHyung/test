package com.xo.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.xo.VO.FileVO;
import com.xo.VO.HomeVO;
import com.xo.mapper.HomeMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private HomeMapper homemapper;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		List<HomeVO> homelist = homemapper.alertboard();
		List<FileVO> filelist = homemapper.filesave();

		model.addAttribute("list", homelist);
		model.addAttribute("list1", filelist);

		return "home";
	}

	@RequestMapping("/insertalertboard")
	public String insertalertboard(@ModelAttribute("vo") HomeVO vo, Model model, HttpServletResponse response)
			throws IOException {
		System.out.println("뭐가들어오냐 : " + vo.toString());
		homemapper.insertalertboard(vo);

		return "redirect:/";
	}

	@RequestMapping("/uploadFile")
	public String uploadFile() {

		return "uploadFile";
	}

	@RequestMapping("/uploadFile2")
	public String uploadFile2() {

		return "uploadFile2";
	}

	private String fileStoragePath = System.getProperty("catalina.home") + File.separator + "tmpFiles";

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public void uploadFileHandler(@RequestPart("uploadFile") MultipartFile file, HttpServletResponse response) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// Creating the directory to store the file (change fileStoragePath to your
				// desired directory)
				File dir = new File(fileStoragePath);
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on the server with the original file name
				String originalFileName = file.getOriginalFilename();
				File serverFile = new File(dir.getAbsolutePath() + File.separator + originalFileName);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location=" + serverFile.getAbsolutePath());

				// Execute JavaScript to close the window and set the value of attach_filename
				String closeWindowScript = "<script>" + "var filename = '" + originalFileName + "';"
						+ "window.opener.document.getElementById('wr_1').value = filename;" + "window.close();"
						+ "</script>";
				response.setContentType("text/html");
				response.getWriter().println(closeWindowScript);

			} catch (Exception e) {
				logger.error("Failed to upload file => " + e.getMessage());
			}
		} else {
			logger.error("No file uploaded.");
		}
	}

	@RequestMapping(value = "/uploadFile2", method = RequestMethod.POST)
	public void uploadFileHandler2(@RequestPart("uploadFile2") MultipartFile file, HttpServletResponse response) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store the file (change fileStoragePath to your
				// desired directory)
				File dir = new File(fileStoragePath);
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on the server with the original file name
				String originalFileName = file.getOriginalFilename();
				File serverFile = new File(dir.getAbsolutePath() + File.separator + originalFileName);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location=" + serverFile.getAbsolutePath());

				// Execute JavaScript to close the window and set the value of attach_filename
				String closeWindowScript = "<script>" + "var filename = '" + originalFileName + "';"
						+ "window.opener.document.getElementById('wr_2').value = filename;" + "window.close();"
						+ "</script>";
				response.setContentType("text/html");
				response.getWriter().println(closeWindowScript);

			} catch (Exception e) {
				logger.error("Failed to upload file => " + e.getMessage());
			}
		} else {
			logger.error("No file uploaded.");
		}
	}

	@RequestMapping(value = "/downloadFile", method = RequestMethod.GET)
	public void downloadFileHandler(@RequestParam("filename") String filename, HttpServletResponse response)
	        throws IOException {
	    File file = new File(fileStoragePath + File.separator + filename);
	    System.out.println(filename.toString());
	    System.out.println("file : " + file.toString());
	    if (file.exists()) {
	        try {
	            System.out.println("File Path: " + file.getAbsolutePath());
	            System.out.println("File Name: " + file.getName());

	            // 파일명을 UTF-8로 인코딩하여 Content-Disposition 헤더에 설정
	            String encodedFilename = URLEncoder.encode(filename, "UTF-8");
	            response.setContentType("application/octet-stream");
	            response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFilename + "\"");

	            FileInputStream fis = new FileInputStream(file);
	            OutputStream os = response.getOutputStream();
	            byte[] buffer = new byte[4096];
	            int bytesRead;
	            while ((bytesRead = fis.read(buffer)) != -1) {
	                os.write(buffer, 0, bytesRead);
	            }

	            os.flush();
	            os.close();
	            fis.close();
	        } catch (IOException e) {
	            logger.error("Failed to download file => " + e.getMessage());
	        }
	    } else {
	        // 파일이 존재하지 않을 때 클라이언트에게 응답으로 전달합니다.
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	        response.getWriter().write("<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "    <meta charset=\"UTF-8\">\n"
	                + "    <title>File Not Found</title>\n" + "</head>\n" + "<body>\n"
	                + "    <!-- 해당 페이지에서 파일이 없음을 표시 -->\n" + "    <script>\n" + "            alert('파일을 찾을 수 없습니다.');\n"
	                + "    </script>\n" + "    <p>파일을 찾을 수 없습니다.</p>\n" + "\n" + "    <script>\n"
	                + "        setTimeout(function () {\n" + "            window.close();\n" + "        }, 10);\n"
	                + "    </script>\n" + "</body>\n" + "</html>");
	        response.getWriter().flush();
	    }
	}
}
