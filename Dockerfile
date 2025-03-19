FROM codercom/code-server:latest

RUN \
    curl -L -o /home/coder/WizCloud.wiz-vscode.vsix https://WizCloud.gallery.vsassets.io/_apis/public/gallery/publisher/WizCloud/extension/wiz-vscode/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage \
    && code-server --install-extension /home/coder/WizCloud.wiz-vscode.vsix \
    && rm /home/coder/WizCloud.wiz-vscode.vsix \
    && mkdir -p /home/coder/.local/share/code-server/User/globalStorage/wizcloud.wiz-vscode \
    && curl -L -o /home/coder/.local/share/code-server/User/globalStorage/wizcloud.wiz-vscode/wizcli-linux-arm64 https://downloads.wiz.io/wizcli/0.73.0/wizcli-linux-arm64 \
    && chmod +x /home/coder/.local/share/code-server/User/globalStorage/wizcloud.wiz-vscode/wizcli-linux-arm64 \
    && git clone https://github.com/wiz-code-demo/public-demo /home/coder/public-demo \
    && echo '{"workbench.colorTheme": "Visual Studio Dark", "editor.formatOnSave": true, "wiz.environment": "demo" }' > /home/coder/.local/share/code-server/User/settings.json 

ENTRYPOINT ["/usr/bin/entrypoint.sh", "--auth", "none", "--bind-addr", "0.0.0.0:8080", "/home/coder/public-demo"]