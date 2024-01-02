package com.tjoeun.ilsan.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tjoeun.ilsan.member.dao.MemberDao;

@Service
@EnableTransactionManagement

public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	@Transactional(readOnly = false
					,propagation = Propagation.REQUIRES_NEW
					,rollbackFor = {Exception.class}
					)
	public void join(Map map) {
		memberDao.insert(map);
	}

	@Override
	@Transactional(readOnly = false
	,propagation = Propagation.REQUIRES_NEW
	,rollbackFor = {Exception.class}
	)
	public Map login(Map map) {
		return memberDao.select(map);
	}

}
