OUTPUT_NAME=paper
INPUT_NAME=paper
BUILD_FOLDER=build

INPUT=${INPUT_NAME}.tex
OUTPUT=$(BUILD_FOLDER)/${OUTPUT_NAME}.pdf

all: ${OUTPUT}
	cp $(OUTPUT) .

.PHONY: everything
everything: images ${OUTPUT}

${OUTPUT}: $(BUILD_FOLDER) $(INPUT)
	latexmk -pdf -outdir=$(BUILD_FOLDER) ${INPUT_NAME}

$(BUILD_FOLDER):
	mkdir -p $(BUILD_FOLDER)

.PHONY: clean
clean:
	rm -rf $(BUILD_FOLDER)
	rm $(OUTPUT_NAME).bbl
	rm -f $(OUTPUT_NAME).pdf

fetch-images:
	rsync -avz myriad:/home/cceajqu/projects/fluting/coronal-fluting-instability-analysis/kink_instability_from_straight/\*.pdf images/kink_instability_straight
