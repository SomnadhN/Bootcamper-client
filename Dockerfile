# Use a base image with Node.js installed to build the React app
FROM node:14 as build

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files into the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Build the React app
RUN npm run build

# Use a lightweight base image for the production environment
FROM nginx:alpine

# Copy the built app from the build stage into the nginx server
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 3000


# Start the nginx server
CMD ["nginx", "-g", "daemon off;"]
