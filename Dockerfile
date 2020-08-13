FROM maichong/node:12.13.0

# Setup app working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# 配置npm阿里镜像源
RUN npm config set registry https://registry.npm.taobao.org
RUN npm config set sass_binary_site http://cdn.npm.taobao.org/dist/node-sass -g

# Install app dependencies
RUN npm install

# Copy sourcecode
COPY . .

# 执行构建
RUN npm run build

# Start app
CMD [ "npm", "start" ]
