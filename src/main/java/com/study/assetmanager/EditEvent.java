package com.study.assetmanager;

public class EditEvent {
	private String type;
	private int rowIndex;
	private int colIndex;
	private String timestamp;
	private String userId; // 추가
    private String username; // 사용자 이름 추가

	// 기존의 생성자, getter, setter...

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	// userId에 대한 getter와 setter 추가
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	// 기본 생성자
	public EditEvent() {
	}

	// 모든 필드를 인자로 받는 생성자
	public EditEvent(String type, int rowIndex, int colIndex, String timestamp, String userId,String username) {
		this.type = type;
		this.rowIndex = rowIndex;
		this.colIndex = colIndex;
		this.timestamp = timestamp;
		this.userId = userId;
	    this.username = username; // 사용자 이름 추가

	}

	// Getter와 Setter
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getRowIndex() {
		return rowIndex;
	}

	public void setRowIndex(int rowIndex) {
		this.rowIndex = rowIndex;
	}

	public int getColIndex() {
		return colIndex;
	}

	public void setColIndex(int colIndex) {
		this.colIndex = colIndex;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
}
