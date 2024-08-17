#!/bin/bash

# Variables
SIGNATURE_NAME="Alexey Nazarov"
WEBSITE="cyberprivacy.tech"
GPG_KEY="BB06DA5139E547C7DBBC709CE9C8246398E9BAC9"
CREATION_DATE="August 2024"
LAST_MODIFIED_DATE="17 August 2024 16:42:00"

# Metadata Content Template
METADATA="Author: Alexey Nazarov (linkedin.com/in/alexeinazarov)\n
Author's GitHub: github.com/alexeinazarov\n
Intended use: For a research analytical piece at $WEBSITE, currently hosted at github.com/cyberprivacytech/cyberprivacytech.github.io, also owned by the author.\n
License: Creative Commons Attribution-ShareAlike (CC BY-SA)\n
Original Creation Date: $CREATION_DATE\n
Date Last Modified: $LAST_MODIFIED_DATE\n
Cryptographic Standards: Metadata signed with GPG (RSA-3072) and SHA-256, compliant with NIST SP 800-131A Rev. 2 and ISO/IEC 9796-2:2022 standards.\n
Legal Framework: This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) license. By using or distributing this image, you agree to the terms of this license and acknowledge that any modifications must also be shared under the same license.\n
Applicable Standards and Legal Notices:\n
- NIST SP 800-131A Rev. 2: Transitioning the Use of Cryptographic Algorithms and Key Lengths (March 2019)\n
- NIST FIPS 186-4: Digital Signature Standard (DSS) (July 2013)\n
- ISO/IEC 9796-2:2022: Information security — Digital signature schemes giving message recovery — Part 2: Integer factorization-based mechanisms.\n
- Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) license.\n
- This image's metadata is protected under these standards, ensuring compliance with international legal and cryptographic frameworks."

# Process each image in the current directory
for IMAGE in *.{jpg,jpeg,png,gif,bmp,tiff,svg}; do
    if [ -f "$IMAGE" ]; then
        IMAGE_NAME=$(basename "$IMAGE")
        METADATA_FILE="${IMAGE_NAME}_metadata.txt"
        OUTPUT_SIGNED_METADATA="${IMAGE_NAME}_metadata_signed.txt"
        OUTPUT_HASH="${IMAGE_NAME}_image_hash.txt"

        # Write Metadata to File
        echo -e "$METADATA" > "$METADATA_FILE"

        # Sign the Metadata File with GPG
        gpg --clearsign --default-key "$GPG_KEY" --output "$OUTPUT_SIGNED_METADATA" "$METADATA_FILE"

        # Read the signed metadata content
        SIGNED_CONTENT=$(cat "$OUTPUT_SIGNED_METADATA")

        # Attach the signed metadata content directly to the image
        exiftool -Comment="$SIGNED_CONTENT" "$IMAGE"

        # Generate a SHA-256 Hash of the Final Image
        sha256sum "$IMAGE" > "$OUTPUT_HASH"

        # Clean up original metadata file (optional)
        rm "$METADATA_FILE"

        echo "Metadata signed, attached to $IMAGE, and SHA-256 hash generated."
    fi
done

