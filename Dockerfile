# Step 1: Specify the base image
FROM node:14

# Step 2: Set the working directory
WORKDIR /usr/src/app

# Step 3: Install dependencies for puppeteer
RUN apt-get update && apt-get install -y \
    gconf-service libgbm-dev libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 \
    libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 \
    libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 \
    libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 \
    libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release \
    xdg-utils wget

# Step 4 and 5: Copy package.json and package-lock.json
COPY package*.json ./

# Step 6: Install dependencies
RUN npm install

# Step 7: Copy the rest of the application
COPY . .

# Step 8: Expose the port
EXPOSE 3000

# Step 9: Define the command to run the app
CMD [ "node", "index.js" ]