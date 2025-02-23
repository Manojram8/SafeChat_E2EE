import 'package:email_otp/email_otp.dart';

class OTPService {

  Future<void> sendOTP(EmailOTP myAuth,String email, String name) async {

    try {

      // var path="/home/pavan9999/AndroidStudioProjects/emailchat/lib/images/safechat.png";
      EmailOTP.setSMTP(
          host: "smtp.gmail.com",
          //auth: true,
          username: "safechat.e2ee@gmail.com",
          password: "ekfm tzhm zrpj pnef",
          secureType: SecureType.tls,
          emailPort: EmailPort.port587
      );

      EmailOTP.config(
          appEmail: "safechat.e2ee@gmail.com",
          appName: "SafeChat",
          //userEmail: email,
          otpLength: 6,
          otpType: OTPType.numeric
      );



      EmailOTP.setTemplate(
          template: '''
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Your {{appName}} Access Code</title>
          <style>
            body {
              font-family: sans-serif; /* Set a modern font */
              margin: 0;
              padding: 0;
              background-color: #f5f5f5; /* Light gray background */
              color: #FFFFFF;
            }
            .container {
              max-width: 600px;
              margin: 0 auto;
              padding: 30px;
              border-radius: 5px; /* Rounded corners */
              
            }
            .header {
              text-align: center;
              margin-bottom: 20px;
            }
            .logo {
              max-width: 150px; /* Adjust logo size as needed */
            }
            .content {
              line-height: 1.5; /* Increase line spacing for readability */
            }
            .otp {
              font-size: 24px;
              font-weight: bold;
              text-align: center;
              margin: 10px 0; /* Spacing above and below */
            }
            .footer {
              text-align: center;
              margin-top: 20px;
              color: #888; /* Light gray text */
            }
        
          </style>
        </head>
        <body>
          <div class="container">
            <div class="header">
                <a href="https://github.com/tpavankumarreddy/SafeChat_E2EEs">
                <img src="https://i.ibb.co/BGzHCsj/banner-Safe-Chat.png" alt="banner-Safe-Chat" border="0"></a>
            </div>
            <div class="content">
              <h2>Hey $name,</h2>
              <p>Thanks for choosing {{appName}}! We're excited to have you on board.</p>
              <p>Here's your one-time access code (OTP) to verify your account:</p>
              <h1 class="otp">{{otp}}</h1>
              <p>Use this code to complete your registration and unlock the awesome features of {{appName}}.</p>
            </div>
            <div class="footer">
              <p>This email was sent from {{appName}}. If you didn't request this, just ignore it.</p>
            </div>
          </div>
        </body>
        </html>



      ''',
      );

     // myAuth.setTemplate(render: template);
  //    myAuth.setTheme(theme: 'default');

  //     String customTemplate = '''
  //   <!DOCTYPE html>
  //   <html lang="en">
  //   <head>
  //     <meta charset="UTF-8">
  //     <meta http-equiv="X-UA-Compatible" content="IE=edge">
  //     <meta name="viewport" content="width=device-width, initial-scale=1.0">
  //     <title>OTP Email</title>
  //   </head>
  //   <body>
  //     <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
  //       <!-- Your custom HTML template goes here -->
  //       <h1>Hello, {{app_name}}!</h1>
  //       <p>Your OTP is: {{otp}}</p>
  //       <p>Please use this OTP to verify your account.</p>
  //     </div>
  //   </body>
  //   </html>
  // ''';

      // Set custom template
     // myAuth.setTemplate(render: customTemplate);

      if (await EmailOTP.sendOTP(email: email) == true) {
        print("OTP has been sent");
      } else {
        print("Oops, OTP send failed");
      }


    } catch (e) {
      print("Network Error: $e");
    }
  }
}
