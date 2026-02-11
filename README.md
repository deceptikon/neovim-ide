# 🚀 Modern Neovim IDE: Gemini-Powered (2026 Edition)

A minimalist, hyper-clean, and ultra-fast Neovim configuration optimized for AI-driven development (**Gemini 3 Pro / Aider**) and modern LSP protocols.

## ✨ Features
- **AI-Native**: Deep integration with `Aider` (Gemini 3 Pro) via a seamless floating terminal.
- **LSP v2.0**: Modern setup powered by `mason.nvim` utilizing the latest `handlers` API.
- **Fuzzy Search**: Lightning-fast file and text navigation via `Telescope`.
- **Cyrillic Friendly**: Full hotkey support for Russian layouts via `langmap` (no more layout switching headaches).
- **Oil Navigation**: Edit your filesystem as if it were a regular text buffer.
- **Lazy Loading**: Near-instant startup times thanks to aggressive deferred plugin loading.

## 🛠 Installation (Arch Linux)

1. Ensure system dependencies are installed:
   ```bash
   sudo pacman -S neovim git ripgrep fd fzf nodejs npm python-pip
   ```
2. Install Aider for AI-assisted coding:
   ```bash
   pip install aider-chat --break-system-packages
   ```
3. Clone the config into `~/.config/nvim/init.lua`.
4. Configure environment variables for Vertex AI in your `.bashrc` or `.zshrc`:
   ```bash
   export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/key.json"
   export GCLOUD_PROJECT="your-project-id"
   ```

## ⌨️ Keybindings (Leader = Space)

| Shortcut | Description |
|----------|-------------|
| `<Space> + a` | **Toggle Aider** (Gemini 3 Pro) |
| `<Space> + ff` | Find Files |
| `<Space> + fg` | Live Grep (Global search) |
| `<Space> + e` | File Explorer (Oil.nvim) |
| `g + d` | Go to Definition |
| `K` | Hover Documentation |
| `<Space> + rs` | Document Symbols |

## 🎨 Themes
Comes with **Tokyo Night** by default. You can easily hot-swap to **Catppuccin** or **Kanagawa** inside `init.lua`.

---
*Crafted with OCD-level perfectionism. No friction, just flow.*




============================================================================

Минималистичная, стерильная и сверхбыстрая конфигурация Neovim, заточенная под разработку с использованием ИИ (**Gemini 3 Pro / Aider**) и современных протоколов LSP.

## ✨ Особенности
- **AI-Native**: Интеграция с `Aider` (Gemini 3 Pro) через плавающий терминал.
- **LSP v2.0**: Современная настройка через `mason.nvim` с использованием актуального API `handlers`.
- **Fuzzy Search**: Быстрый поиск файлов и текста через `Telescope`.
- **Cyrillic Friendly**: Полная поддержка хоткеев на русской раскладке через `langmap`.
- **Oil Navigation**: Редактирование файловой системы как обычного текстового буфера.
- **Lazy Loading**: Молниеносный запуск благодаря отложенной загрузке плагинов.

## 🛠 Установка (Arch Linux)

1. Убедитесь, что установлены системные зависимости:
   ```bash
   sudo pacman -S neovim git ripgrep fd fzf nodejs npm python-pip
   ```
2. Установите Aider для работы с ИИ:
   ```bash
   pip install aider-chat --break-system-packages
   ```
3. Склонируйте конфиг в `~/.config/nvim/init.lua`.
4. Настройте переменные окружения для Vertex AI в вашем `.bashrc` или `.zshrc`:
   ```bash
   export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/key.json"
   export GCLOUD_PROJECT="your-project-id"
   ```

## ⌨️ Горячие клавиши (Leader = Space)

| Клавиши | Описание |
|---------|----------|
| `<Space> + a` | **Toggle Aider** (Gemini 3 Pro) |
| `<Space> + ff` | Поиск файлов (Find Files) |
| `<Space> + fg` | Поиск текста по проекту (Live Grep) |
| `<Space> + e` | Проводник файлов (Oil.nvim) |
| `g + d` | Перейти к определению (Go to Definition) |
| `K` | Показать документацию (Hover Docs) |
| `<Space> + rs` | Список символов в файле (Symbols) |

## 🎨 Темы
По умолчанию установлена **Tokyo Night**. Вы можете легко переключиться на **Catppuccin** или **Kanagawa** в `init.lua`.

---
*Собрано с ОКР-перфекционизмом. Без лишних сучков и задоринок.*



Run the key  init script with arguments:

    With custom location:

    `./configure_aider_gcp.sh /path/to/your/service-account-key.json us-east5`

    Using the default location (us-central1):

    `./configure_aider_gcp.sh /path/to/your/service-account-key.json`





