# AWS CodeDeploy EC2 Project

This is a simple AWS CodeDeploy project using **two EC2 instances** running Amazon Linux 2. The goal is to demonstrate a CI/CD pipeline using CodeDeploy, S3, and EC2 for automated application deployment.

---

## 🧑‍💻 Project Description

- **Web Server (EC2-1)**: Acts as the target server for deployment. The CodeDeploy agent is installed and configured here.
- **Developer Machine (EC2-2)**: Used to develop and push the application code to an S3 bucket and trigger deployments.

---

## 🛠️ Technologies Used

- AWS EC2 (Amazon Linux 2)
- AWS IAM
- AWS S3
- AWS CodeDeploy
- Bash Shell Scripts
- HTML

---

## 📂 Project Structure

```
aws-codedeploy-ec2-project/
├── index.html
├── appspec.yml
├── scripts/
│   ├── httpd_install.sh
│   ├── httpd_start.sh
│   └── httpd_stop.sh
├── screenshots/
│   ├── screenshot-1.png
│   ├── screenshot-2.png
│   └── ...
├── sampleapp.zip
└── README.md
```

---

## 📋 Steps Involved

### 1. Create IAM Role
- Create a role with `AmazonEC2RoleforAWSCodeDeploy` and `AmazonS3ReadOnlyAccess`.
- Attach this role to your web server EC2 instance.

### 2. Create IAM User (Developer)
- Create a user with programmatic access and necessary CodeDeploy and S3 permissions.

### 3. Setup CodeDeploy Agent on Web Server
```bash
sudo yum update -y
sudo yum install ruby wget -y
cd /home/ec2-user
wget https://aws-codedeploy-<region>.s3.<region>.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo systemctl start codedeploy-agent
sudo systemctl enable codedeploy-agent
```

### 4. Create Application Code
- A simple `index.html` and necessary shell scripts to configure Apache server.

### 5. Push Code to S3 from Developer Machine
```bash
aws deploy push --application-name sampleapp --s3-location s3://your-bucket/sampleapp.zip --source . --ignore-hidden-files
```

### 6. Create Deployment Group
- In CodeDeploy console, create a deployment group and attach your web server instance.

### 7. Create Deployment
```bash
aws deploy create-deployment --application-name sampleapp --s3-location bucket=your-bucket,key=sampleapp.zip,bundleType=zip --deployment-group-name sample-group --deployment-config-name CodeDeployDefault.AllAtOnce --description "Initial deployment"
```

### 8. Test Your Application
- Open browser with: `http://<web-server-public-ip>`
- Output: `Hello CL CD class`

---

## 📸 Screenshots

| Screenshot | Description |
|------------|-------------|
![Architecture Diagram]([./AWS-CodeDeploy-Diagram.png](https://github.com/karthickraja12m/aws-codedeploy-ec2-project/blob/68ab1ff068fc772ffc545fda4229351d8f69b0f8/AWS_CodeDeploy_Pipeline_screenshots.pdf))

---

## 👨‍🎓 Author

**Karthickraja M**  
Final Year - B.Tech AI & Data Science  
Sri Shanmugha College of Engineering and Technology

---

## 🧠 Future Improvements

- Integrate with GitHub Actions for full CI/CD.
- Add health checks and rollback strategy.

---

## 📄 License

This project is for educational purposes only.
