SHS_FILES := $(wildcard shs/*.cpp)
CC := g++
CFLAGS := -g
BUILD_DIR = target

make: $(BUILD_DIR) $(SHS_FILES)
	@$(CC) $(SHS_FILES) main.cpp $(CFLAGS) -o $(BUILD_DIR)/main

$(BUILD_DIR):
	@mkdir $(BUILD_DIR)

run: make
	@$(BUILD_DIR)/main

clean:
	@rm -frv $(BUILD_DIR)

nf: newfile

newfile:
	@if [ -z $(name) ]; then echo "'make newfile' expects 'name' param"; exit 1; fi
	@echo "#ifndef $(name)_hpp" > shs/$(name).hpp
	@echo "#define $(name)_hpp" >> shs/$(name).hpp
	@echo ""                     >> shs/$(name).hpp
	@echo "namespace SHS {" >> shs/$(name).hpp
	@echo "  " >> shs/$(name).hpp
	@echo "}" >> shs/$(name).hpp
	@echo "" >> shs/$(name).hpp
	@echo "#endif" >> shs/$(name).hpp

	@echo "#include \"$(name).hpp\"" > shs/$(name).cpp
	
	@echo "created shs/$(name).cpp and shs/$(name).hpp files"

df: delfile

delfile:
	@if [ -z $(name) ]; then echo "'make newfile' expects 'name' param"; exit 1; fi
	@rm -f shs/$(name).cpp shs/$(name).hpp