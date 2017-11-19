package edu.bc.model;

public class StoryHeaderModel {

	int story_header_id;
	int member_id;
	int categories_id;
	String story_header_name;
	String story_header_content;
	String story_header_img;
	double story_header_price;
	String categories_name;
	
	public double getStory_header_price() {
		return story_header_price;
	}

	public void setStory_header_price(double story_header_price) {
		this.story_header_price = story_header_price;
	}

	public int getStory_header_id() {
		return story_header_id;
	}

	public void setStory_header_id(int story_header_id) {
		this.story_header_id = story_header_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
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

	public int getCategories_id() {
		return categories_id;
	}

	public void setCategories_id(int categories_id) {
		this.categories_id = categories_id;
	}

	public String getCategories_name() {
		return categories_name;
	}

	public void setCategories_name(String categories_name) {
		this.categories_name = categories_name;
	}
	
	

}
