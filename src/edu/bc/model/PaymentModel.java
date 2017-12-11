package edu.bc.model;

public class PaymentModel {
	int payment_id;
	int story_header_id;
	int story_detail_id;
	int member_id;
	String truemoney;
	String slip;
	int payment_confirm;

	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public int getStory_header_id() {
		return story_header_id;
	}

	public void setStory_header_id(int story_header_id) {
		this.story_header_id = story_header_id;
	}

	public int getStory_detail_id() {
		return story_detail_id;
	}

	public void setStory_detail_id(int story_detail_id) {
		this.story_detail_id = story_detail_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getTruemoney() {
		return truemoney;
	}

	public void setTruemoney(String truemoney) {
		this.truemoney = truemoney;
	}

	public String getSlip() {
		return slip;
	}

	public void setSlip(String slip) {
		this.slip = slip;
	}

	public int getPayment_confirm() {
		return payment_confirm;
	}

	public void setPayment_confirm(int payment_confirm) {
		this.payment_confirm = payment_confirm;
	}

}
