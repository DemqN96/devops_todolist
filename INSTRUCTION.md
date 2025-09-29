# ToDo App
This is my docker image 

## Docker Hub
       
My DockerHub link
    
https://hub.docker.com/repository/docker/demops096/todoapp

### Step by step instruction

1. Clone forked dir 

    git clone https://github.com/DemqN96/devops_todolist

2. Build local todoapp image

    docker build -t todoapp:1.0.0 .

3. Tag and push to Docker Hub

    docker tag todoapp:1.0.0 demops096/todoapp:1.0.0
    docker login
    docker push demops096/todoapp:1.0.0

4. Run the container

    docker run -d -p 8080:8080 demops096/todoapp:1.0.0

5. Access the application

    Open http://localhost:8080/ in your browser
    
    Note: If you change the port mapping (e.g., -p 9000:8080), access the app at http://localhost:9000/