package edu.bc.model;

public class StoryChapterModel {

	int member_id;
	int story_header_id;
	String story_header_name;
	String story_header_content;
	String story_header_img;
	double story_header_price;
	int story_detail_id;
	String story_detail_act;
	String story_detail_content;
	int payment;
	int payment_confirm;

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getStory_header_id() {
		return story_header_id;
	}

	public void setStory_header_id(int story_header_id) {
		this.story_header_id = story_header_id;
	}

	public String getStory_header_name() {
		return story_header_name;
	}

	public void setStory_header_name(String story_header_name) {
		this.story_header_name = story_header_name;
	}

	public String getStory_header_content() {
		return story_header_content;
	}

	public void setStory_header_content(String story_header_content) {
		this.story_header_content = story_header_content;
	}

	public String getStory_header_img() {
		return story_header_img;
	}

	public void setStory_header_img(String story_header_img) {
		this.story_header_img = story_header_img;
	}

	public double getStory_header_price() {
		return story_header_price;
	}

	public void setStory_header_price(double story_header_price) {
		this.story_header_price = story_header_price;
	}

	public int getStory_detail_id() {
		return story_detail_id;
	}

	public void setStory_detail_id(int story_detail_id) {
		this.story_detail_id = story_detail_id;
	}

	public String getStory_detail_act() {
		return story_detail_act;
	}

	public void setStory_detail_act(String story_detail_act) {
		this.story_detail_act = story_detail_act;
	}

	public String getStory_detail_content() {
		return story_detail_content;
	}

	public void setStory_detail_content(String story_detail_content) {
		this.story_detail_content = story_detail_content;
	}

	public int getPayment_confirm() {
		return payment_confirm;
	}

	public void setPayment_confirm(int payment_confirm) {
		this.payment_confirm = payment_confirm;
	}

}
