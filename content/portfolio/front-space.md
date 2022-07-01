---
title: Front Space
thumbnail: https://github.com/deprov447/FrontSpace/blob/master/assets/logos/logo-text%202/default.png?raw=true
service: ReactJS, Express, JWT
date: 2022-07-01T12:13:40+00:00
deployment: https://getfront.space/
sourceCode: https://github.com/deprov447/FrontSpace
shortDescription: Front space is a platform to quickly create single paged websites and host it for the world to see.
challenge: Creating a landing page from scratch and deploying it takes a lot of time, money and effort (assuming the person knows how to make a website). This restricts many content creators and general public to have a singular place which holds their information for the world to see.
solution: To solve this problem, I created a web PaaS, which helps a user to quickly setup his own landing page in matter of seconds, with predefined templates and easy deployment.
---

### Front end
OK, so the front end is completely made with React.js. I've also used an awesome component library called Chakra UI. The front end is then deployed on Netlify, which also provided me with a fantastic CI/CD pipeline for deployment previews.And lastly, I've used Framer Motion to render some animations.

### Back end
Next is the back end. The back end of our application is an Express app, running on top Node.js. I've used Passport.js and jsonwebtoken both for handling authentication. (I'd love to blog about this if anyone's interested)

### Deployment
Lastly, the deployment. So the back end is deployed on Linode. Next, I used Docker and Docker Compose for containerization and easy deployment of applications. And Nginx to reverse proxy the inbound traffic to docker instance.

## Video Walkthrough

{{< videoembed  >}}
