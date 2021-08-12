package com.ksinfo.employees.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.UploadContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ksinfo.common.util.AuthCheckUtil;
import com.ksinfo.common.util.MessageUtils;
import com.ksinfo.common.util.ObjectUtil;
import com.ksinfo.common.util.PageIndexArr;
import com.ksinfo.common.util.PathCheckUtil;
import com.ksinfo.common.util.SecurityUtil;
import com.ksinfo.common.util.URLCheckUtil;
import com.ksinfo.employees.dto.DepartmentMasterDto;
import com.ksinfo.employees.dto.EmpDto;
import com.ksinfo.employees.dto.EmpIdDto;
import com.ksinfo.employees.dto.PositionMasterDto;
import com.ksinfo.employees.exception.EmpException;
import com.ksinfo.employees.service.EmployeesCommonService;
import com.ksinfo.employees.service.EmployeesWriteService;

@Controller
public class EmployeesWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	EmployeesWriteService wtService;
	@Autowired
	EmployeesCommonService cmnService;	
	@Autowired
	Environment env;

	@RequestMapping(value = "/EmployeesWriteController", method = RequestMethod.GET)
	public ModelAndView empWriteForm(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		URLCheckUtil.urlCheck(req);
		ModelAndView modelAndView = new ModelAndView();
		PageIndexArr pIA = new PageIndexArr(); 
		
		String authCode = (String) req.getSession().getAttribute("adminFlg");
		AuthCheckUtil.authCheckAdmin(authCode);
		
		List<PositionMasterDto> pstDropBox = null;
		List<DepartmentMasterDto> dpDropBox = null;
		
		EmpIdDto curRegistId = wtService.findLastEmpId();
		pstDropBox = cmnService.positionDropBox();
		dpDropBox = cmnService.departDropBox();
		
		pIA.getURLforArray(req, "社員登録","0");
		modelAndView.addObject("curRegistId", curRegistId);
		modelAndView.addObject("pstDropBox", pstDropBox);
		modelAndView.addObject("dpDropBox", dpDropBox);
		modelAndView.setViewName("employees/employeesWriteForm");
		return modelAndView;
	}

	@RequestMapping(value = "/EmployeesWriteController", method = RequestMethod.POST)
	public ModelAndView empInsert(HttpServletRequest req, HttpServletResponse res, MultipartHttpServletRequest request) throws SQLException, IOException {
		ModelAndView modelAndView = new ModelAndView();
		String authCode = (String) req.getSession().getAttribute("adminFlg");
		AuthCheckUtil.authCheckAdmin(authCode);
		
		
		//Data型置換
		java.util.Date stayExpirationDate = null;
		java.util.Date dormInDate = null;
		java.util.Date dormOutDate = null;
		java.util.Date hiredDate = null;
		
		String strStayExpirationDate = req.getParameter("stayExpirationDate");
		String strDormInDate = req.getParameter("dormInDate");
		String strDormOutDate = req.getParameter("dormOutDate");
		String strHiredDate = req.getParameter("hiredDate");
		
		int careerPoint = 0;
		
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			if (!ObjectUtil.isEmpty(strStayExpirationDate)) {
				stayExpirationDate = format.parse(strStayExpirationDate);	
			}
			
			if (!ObjectUtil.isEmpty(strDormInDate)) {
				dormInDate = format.parse(strDormInDate);	
			}
			
			if (!ObjectUtil.isEmpty(strDormOutDate)) {
				dormOutDate = format.parse(strDormOutDate);	
			}			
			
			if (!ObjectUtil.isEmpty(strHiredDate)) {
				hiredDate = format.parse(strHiredDate);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 社員情報取得
		Boolean partnerCompFlg = Boolean.valueOf(req.getParameter("partnerCompFlg"));
		String empId = req.getParameter("empIdHdn");
		String positionCode = req.getParameter("positionCode");
		String empName = req.getParameter("empName");
		String empAge = req.getParameter("empAge");
		Boolean healthInsuranceFlg = Boolean.valueOf(req.getParameter("healthInsuranceFlg"));
		String empGender = req.getParameter("empGender");
		Boolean pensionFlg = Boolean.valueOf(req.getParameter("pensionFlg"));
		String departmentCode = req.getParameter("departmentCode");
		Boolean empInsuranceFlg = Boolean.valueOf(req.getParameter("empInsuranceFlg"));
		String empAddr = req.getParameter("empAddr");
		String phoneNumber = req.getParameter("phoneNumber");
		int dependentCount = Integer.parseInt(req.getParameter("dependentCount"));
		Boolean careerFlg = Boolean.valueOf(req.getParameter("careerFlg"));
		String strCareerPoint = req.getParameter("careerPoint");
		// 社員情報取得（追加-20210607）11件
		String nationality = req.getParameter("nationality");
		String stayExpirationNumber = req.getParameter("stayExpirationNumber");
		String empNameKana = req.getParameter("empNameKana");
		String empNameEng = req.getParameter("empNameEng");
		Boolean empSpouseFlg = Boolean.valueOf(req.getParameter("empSpouseFlg"));
		String residentRegistrationNumber = req.getParameter("residentRegistrationNumber");
		String companyMail = req.getParameter("companyMail");
		String myNumber = req.getParameter("myNumber");														
		String pensionNumber = req.getParameter("pensionNumber");										
		String bankBookNumber = req.getParameter("bankBookNumber");
		String emergencyPhoneNumber = req.getParameter("emergencyPhoneNumber");

		// 社員情報取得（追加-20210712）
		String empPostNo = req.getParameter("empPost");
		String bankName = req.getParameter("bankName");
		String bankBran = req.getParameter("bankBran");
		String bankNumGubun = req.getParameter("bankNumGubun");
		String empSectionName= req.getParameter("empSectionName");
		String empPayLevel= req.getParameter("payLevel");
		
		// 社員情報取得（追加-20210805）
		String[] fileNames = req.getParameterValues("fileName");
		String[] filePaths = req.getParameterValues("fileUrl");
		
		// 파일업로드
		ArrayList<String> fileUrlList = new ArrayList<String>();
		ArrayList<String> fileNameList = new ArrayList<String>();
		String rootUploadDir = env.getProperty("empfolder");

		PathCheckUtil.pathChekAndMakeDir(rootUploadDir);

		MultipartFile mFile = null;
		String orgFileName = ""; // 진짜 파일명
		String sysFileName = ""; // 변환된 파일명
		for (int j = 0; j < request.getMultiFileMap().size(); j++) {
			String umeji = "btn" + j;
			mFile = request.getMultiFileMap().get(umeji).get(0);
			orgFileName = mFile.getOriginalFilename();// 첨부 안하면 여기서 널
			if (!fileNames[j].isEmpty() && orgFileName.isEmpty()) {
				fileNameList.add(j, fileNames[j]);
				fileUrlList.add(j, filePaths[j]);
			} else {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS_");
				Calendar calendar = Calendar.getInstance();
				sysFileName = simpleDateFormat.format(calendar.getTime()); // sysFileName: 날짜-fileLoop번호
				try {
					if (!orgFileName.isEmpty()) {
						mFile.transferTo(new File(rootUploadDir + sysFileName + orgFileName));
						fileUrlList.add(rootUploadDir + sysFileName + orgFileName);
						fileNameList.add(orgFileName);
					} else {
						fileUrlList.add("");
						fileNameList.add("");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} // 파일 업로드 끝
		// ID重複チェック
		if (0 < wtService.duplicationCheck(empId)) {
			String messages = MessageUtils.getMessage("KS_IMSYS_EMPERR_001_JV", new String[] {empId});
			throw new EmpException(messages);
		}
		
		if (!ObjectUtil.isEmpty(strCareerPoint)) {
			careerPoint = Integer.parseInt(strCareerPoint);
		}
		
		EmpDto empDto = new EmpDto();
		String secPassword = "";
		//PW暗号化処理
		if(partnerCompFlg) {
			secPassword = encryption(empId);
		} else {
			secPassword = encryption("1234");	
		}
		
		empDto.setPartnerCompFlg(partnerCompFlg);
		empDto.setEmpId(empId);
		empDto.setStayExpirationDate(stayExpirationDate);
		empDto.setPositionCode(positionCode);
		empDto.setPassword(secPassword);
		empDto.setFieldCode("0001");
		empDto.setDormInDate(dormInDate);
		empDto.setEmpName(empName);
		empDto.setDormOutDate(dormOutDate);
		empDto.setEmpAge(empAge);
		empDto.setHiredDate(hiredDate);
		empDto.setDependentCount(dependentCount);
		empDto.setHealthInsuranceFlg(healthInsuranceFlg);
		empDto.setEmpGender(empGender);
		empDto.setPensionFlg(pensionFlg);
		empDto.setDepartmentCode(departmentCode);
		empDto.setEmpInsuranceFlg(empInsuranceFlg);
		empDto.setEmpAddr(empAddr);
		empDto.setEmpCareerFlg(careerFlg);
		empDto.setPhoneNumber(phoneNumber);
		empDto.setEmpCareerPoint(careerPoint);
		empDto.setAuthCode("03");
		// 社員情報取得（追加-20210607）11件
		empDto.setNationality(nationality);
		empDto.setStayExpirationNumber(stayExpirationNumber);
		empDto.setEmpNameKana(empNameKana);
		empDto.setEmpNameEng(empNameEng);
		empDto.setEmpSpouseFlg(empSpouseFlg);
		empDto.setResidentRegistrationNumber(residentRegistrationNumber);
		empDto.setCompanyMail(companyMail);
		empDto.setMyNumber(myNumber);
		empDto.setPensionNumber(pensionNumber);
		empDto.setBankBookNumber(bankBookNumber);
		empDto.setEmergencyPhoneNumber(emergencyPhoneNumber);

		// 社員情報取得（追加-20210712）
		empDto.setEmpPostNo(empPostNo);
		empDto.setBankName(bankName);
		empDto.setBankBran(bankBran);
		empDto.setBankNumGubun(bankNumGubun);
		empDto.setEmpSectionName(empSectionName);
		empDto.setEmpPayLevel(Integer.parseInt( empPayLevel));
		
		// 社員情報取得（追加-20210805）
		empDto.setEmpFile(fileNameList.get(0));
		empDto.setEmpUrl(fileUrlList.get(0));
		
		wtService.empInsert(empDto);

		modelAndView.setViewName("redirect:/EmployeesListController?curPage=1");
		return modelAndView;
	}

	public String encryption(String obj) {
		SecurityUtil securitiUtil = new SecurityUtil();
		String sec = "";
		sec = securitiUtil.encryptSHA256(obj);
		return sec;
	}
	
}
