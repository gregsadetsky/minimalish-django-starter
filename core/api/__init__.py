from ninja import NinjaAPI

from .sample import router as sample_router

api = NinjaAPI(docs_url=None, openapi_url=None)

api.add_router("/sample", sample_router)
