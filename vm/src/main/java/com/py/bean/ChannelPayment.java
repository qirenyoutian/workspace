package com.py.bean;

import java.util.List;

public class ChannelPayment {
    private Integer channelPaymentId;

    private Integer channelPaymentChannelId;

    private Integer channelPaymentPaymentId;
    
    private List<Channel> channels;
    
    private List<Payment> payments;
    
    

    public Integer getChannelPaymentId() {
        return channelPaymentId;
    }

    public void setChannelPaymentId(Integer channelPaymentId) {
        this.channelPaymentId = channelPaymentId;
    }

    public Integer getChannelPaymentChannelId() {
        return channelPaymentChannelId;
    }

    public void setChannelPaymentChannelId(Integer channelPaymentChannelId) {
        this.channelPaymentChannelId = channelPaymentChannelId;
    }

    public Integer getChannelPaymentPaymentId() {
        return channelPaymentPaymentId;
    }

    public void setChannelPaymentPaymentId(Integer channelPaymentPaymentId) {
        this.channelPaymentPaymentId = channelPaymentPaymentId;
    }

	public List<Payment> getPayments() {
		return payments;
	}

	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}

	public List<Channel> getChannels() {
		return channels;
	}

	public void setChannels(List<Channel> channels) {
		this.channels = channels;
	}
}