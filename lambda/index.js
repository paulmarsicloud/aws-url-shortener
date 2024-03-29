'use strict';
import AWS from 'aws-sdk';

export const handler = async function (event) {
    const eventBody = JSON.parse(event.body);
    const s3 = new AWS.S3();
    let generatedString = '';
    generatedString = Math.random().toString(36).substr(2, 5).split('').map(c => Math.random() < 0.5 ? c.toUpperCase() : c).join('');
    const redirectUrl = 'https://' + process.env.DOMAIN_NAME + '/' + generatedString;
    console.log(redirectUrl);
    let response = {
        statusCode: 200,
        ContentT: 'application/json',
        body: redirectUrl
    };
    console.log(event);
    console.log(generatedString);
    const createdParams = {
        Bucket: process.env.BUCKET,
        Key: generatedString,
        Body: '',
        WebsiteRedirectLocation: eventBody.url
    };
    const checkParams = {
        Bucket: process.env.BUCKET,
        Key: generatedString
    };

    try {
        // object already exists for that generatedString, have user retry
        await s3.headObject(checkParams).promise();
        response.body = 'System Error, Please Refresh and Retry';
        return response;
    } catch (err) {
        try {
            // no object exists for that generatedString, proceed to create
            await s3.upload(createdParams).promise();
            return response;
        } catch (err) {
            console.log(err);
            // error when uploading, have user retry
            response.body = 'System Error, Please Refresh and Retry';
            return response;
        }
    }
};