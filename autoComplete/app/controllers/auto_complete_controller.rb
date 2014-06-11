class AutoCompleteController < ApplicationController
  def saveRun
  	@content = Hash.new 
  	@content["offset"] = params[:offset]
  	@content["code"] = params[:code]
  	@content["fileType"] = params[:fileType]
  	
  	if @content["fileType"] == "java"
	  	@content["fileType"] = "./supportedLanguages/"+params[:fileType]+"/test.java"
  		File.open(@content["fileType"], 'w') { |file| file.write(@content["code"]) }
	  	@resultOfCommand=`/home/abhishek/Downloads/eclipse/eclim -command java_complete -p java -f test.java -o #{@content["offset"]} -e utf-8 -l compact`
  	elsif @content["fileType"] == "cpp"
	  	@content["fileType"] = "./supportedLanguages/"+params[:fileType]+"/test.cpp"
  		File.open(@content["fileType"], 'w') { |file| file.write(@content["code"]) }
	  	@resultOfCommand=`/home/abhishek/Downloads/eclipse/eclim -command c_complete -p cpp -f test.cpp -o #{@content["offset"]} -e utf-8 -l compact`
  	elsif @content["fileType"] == "c"
	  	@content["fileType"] = "./supportedLanguages/"+params[:fileType]+"pp/test.cpp"
  		File.open(@content["fileType"], 'w') { |file| file.write(@content["code"]) }
	  	@resultOfCommand=`/home/abhishek/Downloads/eclipse/eclim -command c_complete -p cpp -f test.cpp -o #{@content["offset"]} -e utf-8 -l compact`
  	elsif @content["fileType"] == "python"
	  	@content["fileType"] = "./supportedLanguages/"+params[:fileType]+"/test.py"
  		File.open(@content["fileType"], 'w') { |file| file.write(@content["code"]) }
	  	@resultOfCommand=`/home/abhishek/Downloads/eclipse/eclim -command python_complete -p python -f test.py -o #{@content["offset"]} -e utf-8`
  	elsif @content["fileType"] == "python3"
	  	@content["fileType"] = "./supportedLanguages/"+params[:fileType]+"/test.py"
  		File.open(@content["fileType"], 'w') { |file| file.write(@content["code"]) }
	  	@resultOfCommand=`/home/abhishek/Downloads/eclipse/eclim -command python_complete -p python3 -f test.py -o #{@content["offset"]} -e utf-8`
  	elsif @content["fileType"] == "ruby"
	  	@content["fileType"] = "./supportedLanguages/"+params[:fileType]+"/test.rb"
  		File.open(@content["fileType"], 'w') { |file| file.write(@content["code"]) }
	  	@resultOfCommand=`/home/abhishek/Downloads/eclipse/eclim -command ruby_complete -p ruby -f test.rb -o #{@content["offset"]} -e utf-8`
  	elsif @content["fileType"] == "php"
	  	@content["fileType"] = "./supportedLanguages/"+params[:fileType]+"/test.php"
  		File.open(@content["fileType"], 'w') { |file| file.write(@content["code"]) }
	  	@resultOfCommand=`/home/abhishek/Downloads/eclipse/eclim -command php_complete -p php -f test.php -o #{@content["offset"]} -e utf-8`
  	end
  	respond_to do |format|
  		format.html
  		format.json { render json: @resultOfCommand }
	end
  end
end
