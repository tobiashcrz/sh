#!/bin/sh

#Set variables
partnerName=${1}
partnerCode=${2}
operationName=${3}
templateName=${4}


# array de templates
declare -A templateFolder
templateFolder[DefaultPipelineTemplate]="templates/DefaultPipelineTemplate"
templateFolder[QueryProductPipelineTemplate]="templates/QueryProductPipelineTemplate"

echo -e "INFO - templateFolder: " ${templateFolder[${templateName}]}

# seleciona o arquivo de template
templateFile="${templateFolder[${templateName}]}/ServiceSubmitOrder.pipeline" ;
echo -e "INFO - templateFile: " ${templateFile}

# limpa arquivo
echo "" > "gen/${operationName}.pipeline"

# gera o arquivo pipeline no IO
eval "echo \"$(< $templateFile)\"" | sed "s/'/\"/g" > "gen/${operationName}.pipeline"
if [ -f "gen/${operationName}.pipeline" ]
then
	echo "INFO - ${operationName}.pipeline: Arquivo gerado com sucesso."
else
	echo "ERRO - ${operationName}.pipeline: Arquivo não foi gerado."
fi