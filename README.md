# iris-data-analysis
Implementing data query and analysis using IRIS vector search and LangChain
## Describe 
IRIS data analysis uses Embedded Python and calls OpenAI to implement dialogue information vectors, as well as querying database data information through dialogues. Data information can also be fed to AI for analysis. Introduced prompt words to enable AI to return the data we need, making it easy for code processing. Convert user questions into vectors and retrieve similar information through IRIS vector indexing.

### Dynamic SQL generation
- Translate user questions into SQL statements using prompt words
### RAG enhancement
- Vectorize and store questions, allowing for vector retrieval of similar problem solutions

## How to use it

### Prerequisites
Make sure you have git and Docker desktop installed.
### Installation
#### 1.Clone/git pull the repo into any local directory
```
git clone https://github.com/landomiller/iris-data-analysis.git
```  
#### Open the terminal in this directory and run

```
docker-compose build
```
#### Run the IRIS container 

```
docker-compose up -d
```
