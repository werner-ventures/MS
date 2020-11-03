FROM werner01ai/PY
RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg --purge packages-microsoft-prod && \
    dpkg -i packages-microsoft-prod.deb && \
    apt=get install --no-install-recommends dotnet-sdk-3.1 && \
    wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe && \
    dotnet new --install Boxed.Templates && \
    dotnet new nuget --name "N30"
WORKDIR "/N30/Source/N30"
RUN dotnet add package FSharp.Core && \
    dotnet add package Xamarin.Essentials && \
    dotnet add package Microsoft.ML && \
    dotnet add package Microsoft.ML.OnnxRuntime.Gpu && \
    dotnet add package Microsoft.ML.TensorFlow && \
    dotnet add package Google.Cloud.Firestore && \
    dotnet tool install -g --add-source "https://dotnet.myget.org/F/dotnet-try/api/v3/index.json" Microsoft.dotnet-interactive && \
ENV PATH="$PATH:/root/.dotnet/tools"
RUN dotnet interactive jupyter install && \
    dotnet nuget locals all -c
