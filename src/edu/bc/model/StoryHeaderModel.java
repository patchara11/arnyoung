package edu.bc.model;

public class StoryHeaderModel {

	int story_header_id;
	int member_id;
	String story_header_name;
	String story_header_content;
	String story_header_img;

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

}
