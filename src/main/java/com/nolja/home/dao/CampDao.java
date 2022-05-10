package com.nolja.home.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.nolja.home.config.DB;
import com.nolja.home.dto.Camp;

public class CampDao {
	private static CampDao listDao = new CampDao();
	
	public static CampDao getListDao() {
		return listDao;
	}

	public ArrayList<Camp> CampList(int page, String query, String doo, String thema, String elec, String internet, 
			String wood, String water, String pool, String playground, String walk, String ground, String workout, String mart, String tram) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<Camp> campLists = new ArrayList<Camp>();  // 캠핑장 검색 결과 저장

	    String sql = "SELECT * FROM camp WHERE facltNm LIKE ? AND doNm LIKE ? AND induty LIKE ?";
	    
	    ArrayList<String> sbrsCl = new ArrayList<String>();  // 세부검색에서 받아온 주요시설만 추가
	    if (elec != null && elec != "") sbrsCl.add(elec);
		if (internet != null && internet != "") sbrsCl.add(internet);
		if (wood != null && wood != "") sbrsCl.add(wood);
		if (water != null && water != "") sbrsCl.add(water);
		if (pool != null && pool != "") sbrsCl.add(pool);
		if (playground != null && playground != "") sbrsCl.add(playground);
		if (walk != null && walk != "") sbrsCl.add(walk);
		if (ground != null && ground != "") sbrsCl.add(ground);
		if (workout != null && workout != "") sbrsCl.add(workout);
		if (mart != null && mart != "") sbrsCl.add(mart);
		if (tram != null && tram != "") sbrsCl.add(tram);
		for (int i = 0; i < sbrsCl.size(); i++) {
			if (sbrsCl.size() == 1) sql += " AND ((sbrsCl LIKE ?))";
			else {
				if (i == 0) sql += " AND ((sbrsCl LIKE ?) ";
				else if (i == sbrsCl.size() - 1) sql += "OR (sbrsCl LIKE ?))";
				else sql += "OR (sbrsCl LIKE ?) ";
			}
		}
	    sql += " ORDER BY facltNm LIMIT ?, 6";
	    
        try {
        		int i = 0;
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setString(1, "%"+query+"%");
        		pstmt.setString(2, "%"+doo+"%");
        		pstmt.setString(3, "%"+thema+"%");
        		for (i = 0; i < sbrsCl.size(); i++) {
        			pstmt.setString(i + 4, "%"+sbrsCl.get(i)+"%");
        		}
            	pstmt.setInt(i + 4, (page - 1) * 6);
        
            	rs = pstmt.executeQuery();
            	while (rs.next()) {
     			Camp campList = new Camp();
     			campList.setContentId(Integer.toString(rs.getInt("contentId")));
     			campList.setSteamingCount(rs.getInt("steamingCount"));
     			campList.setFacltNm(rs.getString("facltNm"));
     			campList.setInduty(rs.getString("induty"));
     			campList.setAddr(rs.getString("addr"));
     			campList.setSbrsCl(rs.getString("sbrsCl"));
     			campList.setImg1(rs.getString("img1"));
        			 
        		campLists.add(campList);
            	}
            	return campLists;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt, rs);
        }     
		return null;
	}
	
	public int CampCount(String query, String doo, String thema, String elec, String internet, 
			String wood, String water, String pool, String playground, String walk, String ground, String workout, String mart, String tram) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT COUNT(*) FROM camp WHERE facltNm LIKE ? AND doNm LIKE ? AND induty LIKE ?";
	    ArrayList<String> sbrsCl = new ArrayList<String>();
	    if (elec != null && elec != "") sbrsCl.add(elec);
		if (internet != null && internet != "") sbrsCl.add(internet);
		if (wood != null && wood != "") sbrsCl.add(wood);
		if (water != null && water != "") sbrsCl.add(water);
		if (pool != null && pool != "") sbrsCl.add(pool);
		if (playground != null && playground != "") sbrsCl.add(playground);
		if (walk != null && walk != "") sbrsCl.add(walk);
		if (ground != null && ground != "") sbrsCl.add(ground);
		if (workout != null && workout != "") sbrsCl.add(workout);
		if (mart != null && mart != "") sbrsCl.add(mart);
		if (tram != null && tram != "") sbrsCl.add(tram);
		
		for (int i = 0; i < sbrsCl.size(); i++) {
			if (sbrsCl.size() == 1) sql += " AND ((sbrsCl LIKE ?))";
			else {
				if (i == 0) sql += " AND ((sbrsCl LIKE ?) ";
				else if (i == sbrsCl.size() - 1) sql += "OR (sbrsCl LIKE ?))";
				else sql += "OR (sbrsCl LIKE ?) ";
			}
		}
        try {
        		int i;
        		pstmt = conn.prepareStatement(sql); 
        		pstmt.setString(1, "%"+query+"%");
        		pstmt.setString(2, "%"+doo+"%");
        		pstmt.setString(3, "%"+thema+"%");
        		for (i = 0; i < sbrsCl.size(); i++) {
        			pstmt.setString(i + 4, "%"+sbrsCl.get(i)+"%");
        		}

            	rs = pstmt.executeQuery();
            	if (rs.next()) {
    				return rs.getInt(1);
    			}
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt, rs);
        }     
		return 0;
	}

	public Camp campDetail(String contentId) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT * FROM camp WHERE contentId = ?";   
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setString(1, contentId);     
            	rs = pstmt.executeQuery();
            	Camp campList = new Camp();
            	while (rs.next()) {
     			campList.setContentId(Integer.toString(rs.getInt("contentId")));
     			campList.setSteamingCount(rs.getInt("steamingCount"));
     			campList.setFacltNm(rs.getString("facltNm"));
     			campList.setLineIntro(rs.getString("lineIntro"));
     			campList.setIntro(rs.getString("intro"));
     			campList.setInduty(rs.getString("induty"));
     			campList.setLctCl(rs.getString("lctCl"));
     			campList.setFeatureNm(rs.getString("featureNm"));
     			campList.setTel(rs.getString("tel"));
     			campList.setAddr(rs.getString("addr"));
     			campList.setSbrsCl(rs.getString("sbrsCl"));
     			campList.setSbrsEtc(rs.getString("sbrsEtc"));
     			campList.setPosblFcltyCl(rs.getString("posblFcltyCl"));
     			campList.setHomepage(rs.getString("homepage"));
     			campList.setResveUrl(rs.getString("resveUrl"));
     			campList.setDoNm(rs.getString("doNm"));
     			campList.setSigunguNm(rs.getString("sigunguNm"));
     			campList.setAnimalCmgCl(rs.getString("animalCmgCl"));
     			campList.setBrazierCl(rs.getString("brazierCl"));
     			campList.setCaravAcmpnyAt(rs.getString("caravAcmpnyAt"));
     			campList.setMapX(rs.getDouble("mapX"));
     			campList.setMapY(rs.getDouble("mapY"));
     			campList.setImg1(rs.getString("img1"));
     			campList.setImg2(rs.getString("img2"));
     			campList.setImg3(rs.getString("img3"));
     			campList.setImg4(rs.getString("img4"));
     			campList.setImg5(rs.getString("img5"));
     			campList.setImg6(rs.getString("img6"));
     			campList.setImg7(rs.getString("img7"));
     			campList.setImg8(rs.getString("img8"));
     			campList.setImg9(rs.getString("img9"));
     			campList.setImg10(rs.getString("img10"));
     			campList.setCreatedtime(rs.getString("createdtime"));
     			campList.setModifiedtime(rs.getString("modifiedtime"));
            	}
            	return campList;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt, rs);
        }     
		return null;
	}

	public int steamingAdd(String boardId) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "UPDATE camp SET steamingCount = steamingCount + 1 WHERE contentId = ?";   
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setInt(1, Integer.parseInt(boardId));       
            	int result = pstmt.executeUpdate();
            	return result;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     
		return 0;
	}

	public int steamingDelete(String boardId) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    String sql = "UPDATE camp SET steamingCount = steamingCount - 1 WHERE contentId = ?";   
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setInt(1, Integer.parseInt(boardId));       
            	int result = pstmt.executeUpdate();
            	return result;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     
		return 0;
	}
	
	public ArrayList<Camp> campSteam(String[] steaming) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<Camp> campLists = new ArrayList<Camp>();
	    String sql;
	    if (steaming[0] != null) {
	    	sql = "SELECT * FROM camp WHERE";   
	    	for (int i = 0; i < steaming.length; i++) {	
	    		if ((steaming.length - 1) == i) {
	    			sql += " contentId = ?";
	    		} else {
	    			sql += " contentId = ? OR";
	    		}
	    	}
	    	try {
	    		pstmt = conn.prepareStatement(sql);
        		for (int i = 0; i < steaming.length; i++) {
        			pstmt.setInt(i + 1, Integer.parseInt(steaming[i]));    
    	    	}			
            	rs = pstmt.executeQuery();
            	while (rs.next()) {
            		Camp campList = new Camp();
            		campList.setContentId(Integer.toString(rs.getInt("contentId")));
         			campList.setSteamingCount(rs.getInt("steamingCount"));
         			campList.setFacltNm(rs.getString("facltNm"));
         			campList.setInduty(rs.getString("induty"));
         			campList.setAddr(rs.getString("addr"));
         			campList.setSbrsCl(rs.getString("sbrsCl"));
         			campList.setImg1(rs.getString("img1"));
         			
         			campLists.add(campList);
            	}
            	return campLists;
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	} finally {
	    		DB.close(conn, pstmt, rs);
	    	}     
	    }
		return null;   
	}

	public int steamingSearch(String boardId) {
		Connection conn = DB.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT steamingCount FROM camp WHERE contentId = ?";   
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setInt(1, Integer.parseInt(boardId));       
            	rs = pstmt.executeQuery();
            	if (rs.next()) {
            		int steaming = rs.getInt("steamingCount");
            		return steaming;
            	}
            	return 0;
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DB.close(conn, pstmt);
        }     
		return 0;
	}
}
