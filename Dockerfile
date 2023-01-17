FROM ghcr.io/graalvm/graalvm-ce:ol7-java17-22.3.0-b2 AS build
RUN gu install native-image
COPY . /app
RUN /app/gradlew nativeCompile

FROM ubuntu
COPY --from=build /app/build/native/nativeCompile/graavm /opt/graavm
CMD ["/opt/graavm"]
