package com.xo.mapper;

import java.util.List;

import com.xo.VO.HomeVO;
import com.xo.VO.FileVO;

public interface HomeMapper {

	List<HomeVO> alertboard();

	void insertalertboard(HomeVO vo);

	List<FileVO> filesave();

}
