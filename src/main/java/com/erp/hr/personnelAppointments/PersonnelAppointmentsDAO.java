package com.erp.hr.personnelAppointments;

import java.util.ArrayList;

import com.erp.hr.personnelAppointments.PaVO;

public class PersonnelAppointmentsDAO {

	// 전체 인사발령 내역 선택 ============================================================
	public ArrayList<PaVO> totalSelect() {
		
		ArrayList<PaVO> palist = new ArrayList<PaVO>();
		
		return palist;
	}


	// 인사발령 내역 페이징 선택 ============================================================
	public ArrayList<PaVO> pagingSelect(int startSeq, int endSeq) {
		
		ArrayList<PaVO> palist = new ArrayList<PaVO>();
		
		return palist;
	}

	
	// 인사발령 내역 한개 선택 ============================================================
	public PaVO detailSelect(int pa_seq) {
		
		return null;
	}


	// 인사발령 내역 등록 ============================================================
	public int insert(PaVO pavo) {
		int rows = 0;
		
		return rows;
	}


	// 인사발령 내역 삭제 ============================================================
	public int delete(String string) {
		int rows = 0;
		
		return rows;
	}
	
	

}
