{
  "builders": [
    {
      "type": "docker",
      "image": "base_image:latest",
      "commit": true
    }
  ],
  "provisioners": [
    {
      "type": "file",
      "source": "./app",
      "destination": "/app"
    },
    {
      "type": "docker-command",
      "inline": [
        "RUN apt-get update",
        "RUN apt-get install -y python",
        "WORKDIR /app",
        "CMD python app.py"
      ]
    }
  ]
}
