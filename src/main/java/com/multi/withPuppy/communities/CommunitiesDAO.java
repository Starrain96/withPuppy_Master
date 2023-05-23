package com.multi.withPuppy.communities;


import java.util.ArrayList;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CommunitiesDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(CommunitiesVO vo) {
		int result = my.insert("communities.insert",vo);
//		System.out.println(vo);
		return result;
	}
	
	public int update(CommunitiesVO vo) {
		int result = my.update("communities.up",vo);
		return result;
	}
	
	public CommunitiesVO one(int commu_no) {
		System.out.println("dao : " + commu_no);
		CommunitiesVO bag = my.selectOne("communities.one",commu_no);
		System.out.println("daovo부르기 : " + bag);
		return bag;
	}
	
	public int delete(int commu_no) {
		int result = my.delete("communities.del", commu_no);
		return result;
	}
	
	public int count() {
		return my.selectOne("communities.count");
	}
	
	
	 // 게시물 정보 가져오기
    public CommunitiesVO modify(int commu_no) {
        CommunitiesVO bag = my.selectOne("communities.one",commu_no);
        return bag;
    }
  
	public List<CommunitiesVO> list(PageVO vo2) {
		return my.selectList("communities.list", vo2);
	}



	
}
