#!/bin/bash

# clean_filenames.sh - Batch-clean .mp3 filenames in the current directory.
# Supports dry-run mode and optional emoji stripping.

# ========== CONFIGURATION ==========
strip_emojis=false
dry_run=false
extensions=("mp3" "wav" "flac") # Supported file types

# ========== COLORS ==========

# Regular Colors
RED='\033[0;31m'    # Red
GREEN='\033[0;32m'  # Green
YELLOW='\033[0;33m' # Yellow
BLUE='\033[0;34m'   # Blue
CYAN='\033[0;36m'   # Cyan
PURPLE='\033[0;35m' # Purple
WHITE='\033[0;37m'  # White
RESET='\033[0m'     # Reset

# Bold Colors
REDB='\033[1;31m'    # Red
GREENB='\033[1;32m'  # Green
YELLOWB='\033[1;33m' # Yellow
BLUEB='\033[1;34m'   # Blue
CYANB='\033[1;36m'   # Cyan
PURPLEB='\033[1;35m' # Purple
WHITEB='\033[1;37m'  # White

# Array of color names
allcolors=("RED" "GREEN" "YELLOW" "BLUE" "CYAN" "PURPLE" "WHITE")

# Function to print banner with a random color
ascii_banner() {

	# Pick a random color from the allcolors array
	random_color="${allcolors[$((RANDOM % ${#allcolors[@]}))]}"

	# Convert the color name to the actual escape code
	case $random_color in
	"RED") color_code=$RED ;;
	"GREEN") color_code=$GREEN ;;
	"YELLOW") color_code=$YELLOW ;;
	"BLUE") color_code=$BLUE ;;
	"CYAN") color_code=$CYAN ;;
	"PURPLE") color_code=$PURPLE ;;
	"WHITE") color_code=$WHITE ;;
	esac

	# ========== DISPLAY ASCII BANNER ==========

	# Print the banner in the chosen color
	echo -e "${color_code}"
	cat <<"EOF"
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⣠⣿⣿⣦⡀⠀⠀⠀⠀
	⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⣴⣿⣿⣿⣿⣿⣄⠀⠀⠀
	⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⢿⠃⢀⣾⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀
	⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣡⣤⣶⣶⣤⣄⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀
	⠀⣾⣿⣿⣿⣿⣿⣿⣿⡿⠀⣾⣿⠟⠉⠉⠻⣿⣷⠀⢿⣿⣿⣿⣿⣿⣿⣿⣷⠀
	⠀⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⡇⠀⠀⠀⠀⢸⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⠀
	⠀⠿⠿⠟⠛⠛⢉⣉⣡⡤⠀⢿⣿⣤⣀⣀⣤⣿⡿⠀⣾⣿⣿⣿⣿⣿⣿⣿⡿⠀
	⠀⠀⣤⣴⣶⡿⠟⢋⣡⣶⣶⣄⠙⠛⠿⠿⠛⠋⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀
	⠀⠀⠙⠋⢁⣠⣶⣿⣿⣿⣿⣿⣿⣷⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀
	⠀⠀⠀⠰⣿⣿⣿⣿⣿⣿⣿MR.FRESH⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀
	⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠈⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠛⠛⠛⠛⠛⠉⠁⠀⠀
    __  ___           __                        __  
   /  |/  /___  _____/ /__  ____ _____    _____/ /_ 
  / /|_/ / __ \/ ___/ / _ \/ __ `/ __ \  / ___/ __ \
 / /  / / /_/ / /__/ /  __/ /_/ / / / / (__  ) / / /
/_/  /_/ .___/\___/_/\___/\__,_/_/ /_(_)____/_/ /_/ 
      /_/ 
EOF
	echo -e "${RESET}" # Reset color
}

# ========== CHECK FOR PERL  ==========

command -v perl >/dev/null || {
	echo -e "${REDB}Error:${RESET} Perl is required for emoji removal. Please install it."
	exit 1
}

# ========== FUNCTIONS ==========

show_help() {
	echo -e "${WHITEB}"
	cat <<EOF
🧹 Usage: ${0##*/} [OPTIONS]

Batch cleans .mp3 filenames by:
  - Removing leading/trailing single quotes
  - Removing text in square brackets
  - Removing characters: | / ( )
  - Replacing spaces with hyphens
  - Collapsing multiple hyphens
  - Trimming leading/trailing hyphens

Options:
  -d, --dry-run        Preview changes without renaming files
  -e, --no-emojis      Strip emojis from filenames
  -h, --help           Show this help menu

EOF
}

# ========== CLEANING LOGIC ==========
remove_emojis() {
	perl -CSDA -pe 's/[\x{1F300}-\x{1F6FF}\x{1F900}-\x{1F9FF}\x{1F1E0}-\x{1F1FF}\x{2600}-\x{26FF}\x{2700}-\x{27BF}]//g'
}

clean_name() {
	local name="$1"
	name="${name##\'}"
	name="${name%%\'}"
	name=$(sed -E 's/\[[^]]*\]//g; s/[|/()]//g; s/[[:space:]]+/-/g; s/-+/-/g; s/^-|-$//g' <<<"$name")
	$strip_emojis && name=$(remove_emojis <<<"$name")
	echo "$name"
}

process_files() {
	shopt -s nullglob
	local count=0 skipped=0

	for ext in "${extensions[@]}"; do
		for file in *."$ext"; do
			[[ -f "$file" ]] || continue

			cleaned_name=$(clean_name "$file")

			if [[ "$file" == "$cleaned_name" ]]; then
				((skipped++))
				continue
			fi

			if [[ -e "$cleaned_name" ]]; then
				echo -e "${REDB}Conflict${RESET}: '$cleaned_name' ${CYANB}already exists. ${GREENB}Skipping${WHITE} '$file'${RESET}."
				((skipped++))
				continue
			fi

			if $dry_run; then
				echo -e "${WHITEB}[${REDB}DRY RUN${WHITEB}]${BLUEB} $file ${GREEN}→ ${WHITEB} $cleaned_name${RESET}"
			else
				mv -n -- "$file" "$cleaned_name" && echo -e "${GREENB}Renamed${RESET}: ${BLUEB}$file ${GREENB}→ ${WHITEB}$cleaned_name"
			fi

			((count++))
		done
	done

	echo -e "\n${GREENB}✔ Done.${RESET} Processed: $count | Skipped: $skipped"
}

# ========== PARSE ARGS ==========
while [[ $# -gt 0 ]]; do
	case "$1" in
	-d | --dry-run) dry_run=true ;;
	-e | --no-emojis) strip_emojis=true ;;
	-h | --help)
		show_help
		exit 0
		;;
	*)
		echo "Unknown option: $1" >&2
		show_help
		exit 1
		;;
	esac
	shift
done

# ========== MAIN ==========
ascii_banner
process_files
