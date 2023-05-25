package com.multi.withPuppy.communities;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(ReplyVO vo) {
		int result = my.insert("reply.create_reply",vo);
		return result;
	}
	
	public int update(ReplyVO vo) {
		int result = my.update("reply.update_reply",vo);
		return result;
	}
	
	public int delete(int reply_no) {
		int result = my.delete("reply.delete_reply", reply_no);
		return result;
	}
	
	public ReplyVO modify(int reply_no) {
        ReplyVO bag = my.selectOne("reply.one",reply_no);
        return bag;
    }
	
	public List<ReplyVO> list(int commu_no) {
		System.out.println(commu_no);
		List<ReplyVO> list =my.selectList("reply.list_reply", commu_no);	
		System.out.println("reply : " + list.size());
		return list;
	}
}
