package com.py.bean;

public class Feedback {
    private Integer feedbackId;

    private Integer feedbackAdminId;

    private Integer feedbackPointId;

    private Integer feedbackMaintenanceState;

    private String feedbackProblemDescription;

    private String feedbackImage;

    private Integer feedbackRead;

    private String feedbackCreateTime;
    
    private Admin admin;
    
    private Point point;
    

    public Integer getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(Integer feedbackId) {
        this.feedbackId = feedbackId;
    }

    public Integer getFeedbackAdminId() {
        return feedbackAdminId;
    }

    public void setFeedbackAdminId(Integer feedbackAdminId) {
        this.feedbackAdminId = feedbackAdminId;
    }

    public Integer getFeedbackPointId() {
        return feedbackPointId;
    }

    public void setFeedbackPointId(Integer feedbackPointId) {
        this.feedbackPointId = feedbackPointId;
    }

    public Integer getFeedbackMaintenanceState() {
        return feedbackMaintenanceState;
    }

    public void setFeedbackMaintenanceState(Integer feedbackMaintenanceState) {
        this.feedbackMaintenanceState = feedbackMaintenanceState;
    }

    public String getFeedbackProblemDescription() {
        return feedbackProblemDescription;
    }

    public void setFeedbackProblemDescription(String feedbackProblemDescription) {
        this.feedbackProblemDescription = feedbackProblemDescription == null ? null : feedbackProblemDescription.trim();
    }

    public String getFeedbackImage() {
        return feedbackImage;
    }

    public void setFeedbackImage(String feedbackImage) {
        this.feedbackImage = feedbackImage == null ? null : feedbackImage.trim();
    }

    public Integer getFeedbackRead() {
        return feedbackRead;
    }

    public void setFeedbackRead(Integer feedbackRead) {
        this.feedbackRead = feedbackRead;
    }

    public String getFeedbackCreateTime() {
        return feedbackCreateTime;
    }

    public void setFeedbackCreateTime(String feedbackCreateTime) {
        this.feedbackCreateTime = feedbackCreateTime == null ? null : feedbackCreateTime.trim();
    }

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Point getPoint() {
		return point;
	}

	public void setPoint(Point point) {
		this.point = point;
	}
}