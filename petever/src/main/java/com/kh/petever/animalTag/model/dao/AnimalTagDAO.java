package com.kh.petever.animalTag.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.petever.animalTag.model.vo.AnimalTag;

public interface AnimalTagDAO {

	int insertAniTag(AnimalTag aniTag);

	List<AnimalTag> selectList(String userId, RowBounds rowBounds);

	int animalTagCount(String userId);

	AnimalTag selectOne(AnimalTag aniTag);

}
