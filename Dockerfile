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

# Expose port 3000 (assuming your React app runs on port 3000)
EXPOSE 3000

# Command to run the React app
CMD ["npm", "start"]
