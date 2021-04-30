FROM r-base
RUN apt update && apt install -y libglpk-dev libssl-dev libcurl4-openssl-dev pandoc
RUN Rscript -e 'install.packages(c("ROI.plugin.glpk", "rmarkdown", "plotly", "DT", "plyr"), repos=c("https://cloud.r-project.org"))'
RUN Rscript -e 'install.packages("rmpk", repos=c("https://r-opt.r-universe.dev", "https://cloud.r-project.org"))'
RUN apt install -y libxml2-dev
RUN Rscript -e 'install.packages("devtools", repos=c("https://cloud.r-project.org"))'
RUN Rscript -e 'devtools::install_github("r-opt/ROIoptimizer")'
CMD Rscript -e 'rmarkdown::render("MINT_Summary_version1.Rmd")'
