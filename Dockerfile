# ---- Base image ----
FROM python:3.12-slim

# ---- Install pipx & Strix CLI ----
RUN apt-get update && apt-get install -y git && \
    pip install --no-cache-dir pipx && \
    pipx ensurepath && \
    pipx install strix-agent

# ---- Set working directory ----
WORKDIR /app

# ---- Copy project files ----
COPY . .

# ---- Environment variables (اختياري) ----
ENV STRIX_LLM="openai/gpt-5"
ENV LLM_API_KEY="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"



# ---- Default command ----
CMD ["strix", "--help"]
