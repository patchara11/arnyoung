package edu.bc.model;

public class StoryDetailModel {

	int story_detail_id;
	String story_detail_act;
	String story_detail_content;
	int story_header_id;
	double story_detail_price;

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

	public int getStory_header_id() {
		return story_header_id;
	}

	public void setStory_header_id(int story_header_id) {
		this.story_header_id = story_header_id;
	}

	public double getStory_detail_price() {
		return story_detail_price;
	}

	public void setStory_detail_price(double story_detail_price) {
		this.story_detail_price = story_detail_price;
	}

}
