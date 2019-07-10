# compiler_store
A dockerfile that contains a script to compile code in C, C++, Python and Java.

## Description
The image is based off alpine linux base image, and contains necessary tools to compile code in C, C++, python(2 and 3) and Java. It also contains a script that compiles code according to parameters specified in a JSON file. More details below. 

### Building
1. Option 1: Build the image from source. 
  * Clone this repo, and `cd` into it. 
  * Run `docker build -t alcoding/compiler_store .` to build the image with the appropriate name

2. Option 2: Pull image from Docker Hub
  * Run `docker pull alcoding/compiler_store`.

### Running 
1. Create an JSON file with appropriate parameters (Mentioned below) 
2. Create and run the container in interactive mode and pass the JSON file as `stdin`.  
  Example `docker run --rm -i alcoding/compiler_store < example.json`

## Options for json input

### Input
| Attribute      | Options        | Default | Description                                                                                                                                                                                                                                      |
|----------------|----------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| language       | string         | none    | Specifies one of the supported languages. (Refer the table below)                                                                                                                                                                                |
| stdin          | string         | ""      | Specifies the standard input for the program.  Note: This overrides 'testCases'.                                                                                                                                                                 |
| testCases      | array(strings) | [""]    | Specifies the test cases to run.                                                                                                                                                                                                                 |
| timeout        | string         | 0       | Specifies the timeout before program is killed. timeout is  a  floating  point  number with an optional suffix: 's' for seconds (the default), 'm' for minutes, 'h' for hours or 'd' for days.  A duration of 0 disables the associated timeout. |
| files          | array(object)  | []      | Specifies files to compile and run.                                                                                                                                                                                                              |
| files:[object] | json object    | {}      | Contains two parameters: "name" of the file and "content" of that specificfile.                                                                                                                                                                  |

### Supported languages
| Codename | Language       |
|----------|----------------|
| c        | C language     |
| cpp      | C++11          |
| python   | Python3.6      |
| python3  | Python3.6      |
| python2  | Python2.7      |
| java     | Java(openjdk8) |
