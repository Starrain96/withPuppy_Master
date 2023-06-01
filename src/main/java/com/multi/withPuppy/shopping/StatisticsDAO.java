package com.multi.withPuppy.shopping;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatisticsDAO {

	@Autowired
	public SqlSessionTemplate my;

	// 매출현황 데이터 가져오기
	public int[] salesAll() {
		int[] arr = new int[4];
		arr[0] = my.selectOne("statistics.saleAll");
		arr[1] = my.selectOne("statistics.saleDay");
		arr[2] = my.selectOne("statistics.saleMonth");
		arr[3] = my.selectOne("statistics.saleYear");
		return arr;
	}

	// 카테고리별 데이터 가져오기
	public List<StatisticsVO> bringS() {
		List<StatisticsVO> list = my.selectList("statistics.cateS");
		return list;
	}

	// 오늘 카테고리별 매출
	public List<StatisticsVO> cateDaily() {
		List<StatisticsVO> list = my.selectList("statistics.saleDayCate");
		list = validate_static_list(list);
		return list;
	}

	// 값 없을 경우 0 넣기
	private List<StatisticsVO> validate_static_list(List<StatisticsVO> list) {
		String[] cate = { "사료", "간식", "건강관리", "위생/배변", "미용/목욕", "급식기/급수기", "하우스/울타리", "이동장", "의류/악세서리", "목줄/인식표/리드",
				"장난감", "훈련" };

		for (String category : cate) {
			boolean found = false;
			for (StatisticsVO vo : list) {
				if (vo.getS_name().equals(category)) {
					found = true;
					break;
				}
			}
			if (!found) {
				StatisticsVO bag = new StatisticsVO();
				bag.setS_name(category);
				bag.setS_num(0);
				list.add(bag);
			}
		}

		return list;
	}

	// 월별 매출 1년
	public List<StatisticsVO> saleMonthly1() {
		List<StatisticsVO> list = my.selectList("statistics.saleMonthly1");
		return list;
	}

	// 월별 매출 6개월
	public List<StatisticsVO> saleMonthly2() {
		List<StatisticsVO> list = my.selectList("statistics.saleMonthly2");
		return list;
	}

	// 월별 매출 3개월
	public List<StatisticsVO> saleMonthly3() {
		List<StatisticsVO> list = my.selectList("statistics.saleMonthly3");
		return list;
	}

}
