package com.study.chatting;

import com.google.gson.Gson;

public class ChattingVO {
	
	 private String type;
	    private String message;
	    private String from;
	    private String to;
	    private long timestamp;
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getFrom() {
			return from;
		}
		public void setFrom(String from) {
			this.from = from;
		}
		public String getTo() {
			return to;
		}
		public void setTo(String to) {
			this.to = to;
		}
		public long getTimestamp() {
			return timestamp;
		}
		public void setTimestamp(long timestamp) {
			this.timestamp = timestamp;
		}
		@Override
		public String toString() {
			return "MessageVO [type=" + type + ", message=" + message + ", from=" + from + ", to=" + to + ", timestamp="
					+ timestamp + "]";
		}
	
		public static ChattingVO converMessage(String payload) {
	        Gson gson = new Gson();
	        return gson.fromJson(payload, ChattingVO.class);
	    }
	
	
	
}
