package com.tjoeun.ilsan.member.sql;

import java.util.Map;

public interface MemberMapper {
	
	public void insert(Map map);

	public Map select(Map map);

}
