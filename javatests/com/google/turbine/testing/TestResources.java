/*
 * Copyright 2021 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.google.turbine.testing;

import static java.nio.charset.StandardCharsets.UTF_8;
import static java.util.Objects.requireNonNull;

import com.google.common.io.ByteStreams;
import java.io.IOException;
import java.io.InputStream;
import java.io.UncheckedIOException;

public final class TestResources {

  public static String getResource(Class<?> clazz, String resource) {
    return new String(getResourceBytes(clazz, resource), UTF_8);
  }

  public static byte[] getResourceBytes(Class<?> clazz, String resource) {
    try (InputStream is = requireNonNull(clazz.getResourceAsStream(resource), resource)) {
      return ByteStreams.toByteArray(is);
    } catch (IOException e) {
      throw new UncheckedIOException(e);
    }
  }

  private TestResources() {}
}
