Front Space: Create your portfolio in seconds

Front Space is a platform to quickly create single-page websites and host them on a custom subdomain for the world to see. 

# A Quick Back Story

I am always fascinated with beautiful web designs and portfolios. I randomly scroll through Product Hunt and r/web_design. And this app is basically a result of that only. For a long time, I had been thinking of making such an app, but couldn't find the motivation. But thanks to Hashnode and Linode, here we are.

# Walkthrough

<div style=" width:100px"><iframe src="https://frontspace.trainn.co/share/yzX4g9NRYP4oJDCPRFC5pQ/embed?autoplay=false" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen allow="autoplay; fullscreen" style="width:1000px; height: 500px"></iframe></div>
<br/>

# Build with

Of course, love. But also a number of amazing technologies.

## Front end

OK, so the front end is completely made with **React.js**. I've also used an awesome component library called **Chakra UI**. The front end is then deployed on **Netlify**, which also provided me with a fantastic CI/CD pipeline for deployment previews.And lastly, I've used **Framer Motion** to render some animations.

## Back end

Next is the back end. The back end of our application is an **Express app**, running on top **Node.js**. I've used  **Passport.js and jsonwebtoken both** for handling authentication. (I'd love to blog about this if anyone's interested)

## Deployment

Lastly, the deployment. So the back end is deployed on **Linode**, which provided an awesome $100 credit (recommended to check this out, the instances are as cheap as $5 a month). Next, I used Docker and **Docker Compose** for containerization and easy deployment of applications. And **Nginx** to reverse proxy the inbound traffic to docker instance.

## Other

- **Gitpod**: an awesome cloud IDE

- **Github actions**

- **Cloudflare**: DNS management

- **Hostinger**: domain

# Some Pages Made

![img3](https://api.microlink.io?url=https%3A%2F%2Fhimniz.getfront.space&overlay.browser=dark&overlay.background=%2300000000&screenshot=true&meta=false&embed=screenshot.url)

![img2](https://api.microlink.io?url=https%3A%2F%2Fdeprov447.getfront.space&overlay.browser=dark&overlay.background=%2300000000&screenshot=true&meta=false&embed=screenshot.url align="center")

![img1](https://api.microlink.io?url=https%3A%2F%2Fprinsu-pyaara.getfront.space&overlay.browser=dark&overlay.background=%2300000000&screenshot=true&meta=false&embed=screenshot.url align="center")

# Links

**Website:** [https://getfront.space](https://getfront.space)

**Source code:** [https://github.com/deprov447/frontspace/](https://github.com/deprov447/frontspace)

# Contribute

![It ain't much, but it's honest work.](https://i.imgur.com/OwvD1q6.jpg)

I know the app has a number of flaws, and I'm continuously working to make it a good product. But to achieve that, your help is needed. 

If you find any flaw in the app, please file an issue on [Github](https://github.com/deprov447/frontspace/issues/new/choose). Or feel free to [mail me](mailto:deprov447+frontspace.protonmail.com). 

And if you can, contribute <3
