1. What is in an the archive and how to unarchive it?
     - According to wikipedia, an archive is a file that contain
     one or more files or directories
     that may have been compressed.
     The zip  file generally uses the file extensions.zip
     or ZIP and the MIME media type application_zip.

To archive a file use
     - zip my_zip_file file1 file2 file3

To unarchive a file use:
     - unzip my_zip_file file1 file2 file3

2. What are the commands to start and stop the application?
     - hugo server (start the application)
     - Ctrl + c (stop the server)

3. How to customize where the application logs are written?
     - hugo --log=<path_to_LOG_directory>

4. How to “quickly” verify that the application is running (health check)?
Use the built-in health check feature.
     First create a file 'health.txt', containing a string example: "OK"
     in the root of the Hugo project.
     - To access the health check endpoint http://localhost:1313/health
The endpoint will return the string "OK", in the case of healthy application.\n