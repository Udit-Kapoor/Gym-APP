const String _baseURL = 'https:/p2c-gym.heerokuapp.com';
//TODO add forgot password url once backend completes this
const String forgot_password = '';

const String rest_auth = '$_baseURL/rest-auth';

const String loginURL = '$rest_auth/login/';
const String logoutURL = '$rest_auth/logout/';

const String core = '$_baseURL/core';
//CORE-Enquiry
const String enquiry = '$core/enquiry/';
const String enquiry_post = '$core/enquiry/post/';
const String followup = 'followup/';
//CORE-contact
const String contact = '$core/contact/';
//CORE-feedback
const String feedback = '$core/feedback/';
//CORE-trainer-feedback
const String trainer_feedback = '$core/trainer-feedback/';
//CORE-complaint
const String complaint = '$core/complaint/';
const String complaint_checkstatus = '$core/complaint/changestatus/';
