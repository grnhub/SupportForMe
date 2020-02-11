package com.supportforme.biz.common;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

@Component
public class CommonExcelView extends AbstractXlsxView {
private static final Logger LOGGER = LoggerFactory.getLogger(CommonExcelView.class);

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Sheet sheet = workbook.createSheet("Datatypes in Java");
		Row row;
		Cell cell;
		int rowNum = 0;
		String file_name = (String) model.get("filename") + System.currentTimeMillis() + ".xlsx";
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file_name + "\"");
		// header 출력
		String[] headers = (String[]) model.get("headers");
		if (headers != null) {
			row = sheet.createRow(rowNum++);
			int colNum = 0;
			for (String header : headers) {
				if(header.equals("investNo")) {header = "투자번호";}
				if(header.equals("name")) {header = "이름";}
				if(header.equals("presentName")) {header = "선물명";}
				if(header.equals("postcode")) {header = "우편번호";}
				if(header.equals("address")) {header = "주소";}
				if(header.equals("email")) {header = "이메일";}
				if(header.equals("phoneNum")) {header = "휴대폰 번호";}
				if(header.equals("projectName")) {header = "프로젝트명";}
				row.createCell(colNum++).setCellValue(header);
			}
		}
		// body 출력
		List<Map<String, Object>> list = (List<Map<String, Object>>) model.get("datas");
		if (headers != null) {
			for (Map<String, Object> map : list) {
				row = sheet.createRow(rowNum++);
				int colNum = 0;
				for (String header : headers) {
					cell = row.createCell(colNum++);
					Object field = map.get(header);
					if (field == null) {
						field = "";
					}
					if (field instanceof String) {
						cell.setCellValue((String) field);
					} else if (field instanceof BigDecimal) {
						cell.setCellValue(((BigDecimal) field).doubleValue());
					} else if (field instanceof Date) {
						cell.setCellValue((Date) field);
					} else {
						cell.setCellValue(field.toString());
					}
				}
			}
		} else {
			for (Map<String, Object> map : list) {
				row = sheet.createRow(rowNum++);
				int colNum = 0;
				Iterator<String> iter = map.keySet().iterator();
				while (iter.hasNext()) {
					cell = row.createCell(colNum++);
					Object field = map.get(iter.next());
					if (field instanceof String) {
						cell.setCellValue((String) field);
					} else if (field instanceof BigDecimal) {
						cell.setCellValue(((BigDecimal) field).doubleValue());
					} else if (field instanceof Date) {
						cell.setCellValue((Date) field);
					} else {
						cell.setCellValue(field.toString());
					}
				}
			}
		}
		LOGGER.debug("### buildExcelDocument Map : {} end!!");
		//Systemout.println("### buildExcelDocument Map : {} end!!"); 과 같음 
	}
}
