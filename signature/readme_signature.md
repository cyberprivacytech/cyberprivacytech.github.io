# Cyber Privacy Meme with Signed Metadata

## Files Included

- **Swole_Doge_vs_Cheems_Cyber_Privacy_2024.png**: The final image with embedded metadata, signed using GPG and compliant with NIST and ISO standards.
- **Swole_Doge_vs_Cheems_Cyber_Privacy_2024_metadata_signed.txt**: The text file containing the signed metadata, which can be verified using my GPG public key.
- **secure_metadata.sh**: The script used to create, sign, and embed the metadata into the image. This script demonstrates compliance with international cryptographic standards.
- **Swole_Doge_vs_Cheems_Cyber_Privacy_2024_image_hash.txt**: The SHA-256 hash of the final image, used for verifying its integrity.

## Description

This repository contains a meme image created for a research analytical piece at cyberprivacy.tech. The image has been embedded with detailed metadata, signed using GPG (RSA-3072) with SHA-256, ensuring compliance with the latest NIST and ISO standards. The metadata includes legal notices under the Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) license.

### Compliance Details

- **Cryptographic Standards**: The image metadata is signed using RSA-3072 and SHA-256, in compliance with:
  - **NIST SP 800-131A Rev. 2**: Transitioning the Use of Cryptographic Algorithms and Key Lengths (March 2019).
  - **NIST FIPS 186-4**: Digital Signature Standard (DSS) (July 2013).
  - **ISO/IEC 9796-2:2022**: Information security — Digital signature schemes giving message recovery — Part 2: Integer factorization-based mechanisms.

The `secure_metadata.sh` script is provided for transparency and reproducibility, allowing others to verify or recreate the signing process.

## Legal Notice

This image and its metadata are licensed under the Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) license. By using or distributing this image, you agree to the terms of this license and acknowledge that any modifications must also be shared under the same license.

## Instructions

1. **Run the Script**: To embed signed metadata into a PNG image, place your image in the `/assets/images/` directory and run the `secure_metadata.sh` script from within the `/signature/` directory. Provide the relative path to the image as an argument.
   ```bash
   ./secure_metadata.sh ../assets/images/your_image.png
   ```

2. **Verify Integrity**: After running the script, the signed metadata and SHA-256 hash will be generated in the `/assets/images/` directory. Use the hash to verify the integrity of the image.

### Summary of Changes:
1. **File Names Updated**: The names of the signed metadata and hash files have been updated to match the image file, ensuring clarity.
2. **Detailed Compliance**: The README now includes a section detailing the cryptographic standards and legal frameworks to which the metadata and signing process comply.
3. **Usage Instructions**: Clear instructions on how to run the script and verify the integrity of the image are included.

### Next Steps:
- Place this `README.md` file in the `/signature/` directory on GitHub.
- Ensure all other relevant files (the script, signed metadata, and hash) are correctly placed in the `/assets/images/` directory and are properly ignored in the `.gitignore` file.

This README will help others understand the purpose of each file, the standards you’re complying with, and how to use the script you’ve created.
