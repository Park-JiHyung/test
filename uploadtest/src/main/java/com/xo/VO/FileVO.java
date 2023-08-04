package com.xo.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FileVO {
	private String bo_table;
	private int wr_id;
	private int bf_no;
	private String bf_source;
	private String bf_file;
	private int bf_download;
	private String bf_content;
	private String bf_fileurl;
	private String bf_thumburl;
	private String bf_storage;
	private int bf_filesize;
	private int bf_width;
	private int bf_height;
	private int bf_type;
	private String bf_datetime;
}
