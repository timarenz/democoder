FROM codercom/code-server:latest

# Only required if full Docker is required, which is not the case.
# USER root
# RUN apt-get update \
#     && apt-get install -y ca-certificates curl \
#     && install -m 0755 -d /etc/apt/keyrings \
#     && curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc \
#     && chmod a+r /etc/apt/keyrings/docker.asc \
#     && echo \
#     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
#     $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#     tee /etc/apt/sources.list.d/docker.list > /dev/null \
#     && apt-get update \
#     && apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
#     && rm -rf /var/lib/apt/lists/* \
#     && usermod -aG docker coder

USER coder
RUN \
    curl -L -o /home/coder/HashiCorp.terraform.vsix https://HashiCorp.gallery.vsassets.io/_apis/public/gallery/publisher/HashiCorp/extension/terraform/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage \
    && code-server --install-extension /home/coder/HashiCorp.terraform.vsix \
    && rm /home/coder/HashiCorp.terraform.vsix \
    && curl -L -o /home/coder/WizCloud.wiz-vscode.vsix https://WizCloud.gallery.vsassets.io/_apis/public/gallery/publisher/WizCloud/extension/wiz-vscode/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage \
    && code-server --install-extension /home/coder/WizCloud.wiz-vscode.vsix \
    && rm /home/coder/WizCloud.wiz-vscode.vsix \
    && mkdir -p /home/coder/.local/share/code-server/User/globalStorage/wizcloud.wiz-vscode \
    && curl -L -o /home/coder/.local/share/code-server/User/globalStorage/wizcloud.wiz-vscode/wizcli-linux-arm64 https://downloads.wiz.io/wizcli/0.78.0/wizcli-linux-arm64 \
    && chmod +x /home/coder/.local/share/code-server/User/globalStorage/wizcloud.wiz-vscode/wizcli-linux-arm64 \
    && mkdir -p /home/coder/repo \
    && echo '{"workbench.colorTheme": "Visual Studio Dark", "editor.formatOnSave": true, "terraform.languageServer.enable": false, "wiz.environment": "demo", "wiz.showOnlyPolicyMatches": true, "wiz.Enable IAC Ignore Comments": true}' > /home/coder/.local/share/code-server/User/settings.json 

ENTRYPOINT ["/usr/bin/entrypoint.sh", "--auth", "none", "--bind-addr", "0.0.0.0:8080", "/home/coder/repo"]